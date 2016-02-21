class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  # 〜以外という場合はonlyの代わりにexceptをはめる
  before_action :set_company, only: [:new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

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
    @customer.destroy
    redirect_to customer_url
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end
    def set_company
      @companies = Company.all
    end
    def customer_params
      params.require(:customer).permit( :family_name, :given_name, :email, :company_id)
    end

end
