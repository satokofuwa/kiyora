class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show]
 
  def show
    @tasks=Task.all
    @prefectures = Prefecture.all
    @task=@tasks.find(@customer.task_id)

    @prefectures.each do |prefecture|
      if @customer.prefecture== prefecture.kanji
        @prefecture= prefecture.romaji
      end
    end

  end
  private
  def customer_params 
    params.require(:customer).permit(:name,:tel,:zip,:prefecture,:address,:room_number)
  end

 def set_customer
  #@customer=@task.customers.id
  @customer = Customer.find(params[:id])
 end
end
