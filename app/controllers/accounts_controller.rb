class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show

    # 引数あればそちらを使用 => 201308
    # TODO 入力チェック
    if params[:target].nil? then
      targetMonth = Date.today.strftime('%Y%m')
    else
      targetMonth = params[:target]
    end

    @monthlyBalance = getMonthlyBalance(@account.id, targetMonth)

    # 月初日
    @firstDay = Date.parse(targetMonth + "01")

    # その月の日数
    dayCount = @firstDay.at_end_of_month.day

    # 資金繰り表作成
    @dayBalances = Array.new
    for i in 1..dayCount do
      dayBalance = DayBalance.new
      dayBalance.day = i

      @dayBalances.push(dayBalance)
    end

    statements = Statement.where(account_id: @account.id, month: targetMonth)
    statements.each do |statement|
      index = statement.date.day
      @dayBalances[index].addStatement(statement)
    end

    # 翌月、前月
    @nextMonth = getNextMonth(targetMonth)
    @prevMonth = getPrevMonth(targetMonth)
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @account }
      else
        format.html { render action: 'new' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name)
    end

    def getMonthlyBalance(accountId, targetMonth)
      monthlyBalance = MonthlyBalance.find_by(account_id: accountId, month: targetMonth);
      if monthlyBalance.nil? then
        return createMonthlyBalance(accountId, targetMonth)
      end
      return monthlyBalance
    end

    def createMonthlyBalance(accountId, targetMonth)

      if isOldBalance(accountId, targetMonth) then
        #TODO 古いものの場合
        return MonthlyBalance.new(:account_id => accountId, :month => targetMonth, :date => Date.parse(targetMonth + "01"), :balance => 99999)
      end

      prevMonth = getPrevMonth(targetMonth)
      prevMonthlyBalance = getMonthlyBalance(accountId, prevMonth)

      endOfMonthlyBalance = getEndOfMonthBalance(prevMonthlyBalance)

      return MonthlyBalance.create(:account_id => accountId, :month => targetMonth, :date => Date.parse(targetMonth + "01"), :balance => endOfMonthlyBalance)
    end

    def getEndOfMonthBalance(monthlyBalance)

      balance = monthlyBalance.balance
      statements = Statement.where(account_id: monthlyBalance.account_id, month: monthlyBalance.month)
      statements.each do |statement|
        if statement.inout == 'in' then
          balance += statement.amount
        else
          balance -= statement.amount
        end
      end
      return balance
    end

    def isOldBalance(accountId, month)
      #TODO 一番古い明細を取得
      if month.to_i <= 201307 then
        return true
      end
      return false
    end

    def getPrevMonth(month)
      return (Date.parse(month + "01") << 1).strftime('%Y%m')
    end

    def getNextMonth(month)
      return (Date.parse(month + "01") >> 1).strftime('%Y%m')
    end

end
