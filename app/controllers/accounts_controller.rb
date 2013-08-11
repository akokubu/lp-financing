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
    
    @monthlyBalance = MonthlyBalance.find_by(account_id: @account.id, month: targetMonth);
    
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
    
    statements = Statement.where(month: targetMonth)
    statements.each do |statement|
      index = statement.date.day
      puts index
      @dayBalances[index].addStatement(statement)
    end
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
end
