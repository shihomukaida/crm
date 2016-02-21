class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  # 〜以外という場合はonlyの代わりにexceptをはめる
  before_action :set_company, only: [:new, :edit]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # true
      redirect_to @customer
    else
      #false
      render :new
    end
  end

  def update
    # validationの組み込み
    if
      redirect_to @customer
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customer_url
  end

  private
    def customer_params
      params.require(:customer).permit( :family_name, :given_name, :email, :company_id, :post)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

end
