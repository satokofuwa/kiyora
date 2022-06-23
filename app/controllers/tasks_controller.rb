class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :set_search
  before_action :set_task,only: %i[update show edit destroy ]
  before_action :set_show, only: [:show]
  before_action :check_user, only: %i[edit]

  def index
    @tasks = Task.all
    @users= User.all
    @q= Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
    @customer =Customer.all
    
  end

  def new
    @date = Date.current.strftime('%Y/%m/%d')
    @tasks = @q.result(distinct: true).order(created_at: :desc)
    @task = Task.new  
    @property = Property.new
    @partner= Partner.new
    @partner = @task.partners.build
    @front_managers = @task.front_managers.build
    @worker = Worker.new
    @worker = @task.workers.build

    @manager = FrontManager.new
    @customer = @task.customers.build
    @user=@task.users.build
    @agent= Agent.new
  end
  def create
    @task = Task.new(task_params)
    @task.valid?
      if @task.save
        redirect_to tasks_path, notice:  t('shared.new')
      else
        render :new, notice:  t('shared.failure_new') 
      end
  end
  
  def update
    @partner=Partner.all
    @property = @task.properties.find_by(id: params[:id])
    @partners= @task.partners
    @worker = @task.workers
    @task.valid?
    if @task.update(task_params)
      redirect_to tasks_path, notice:  t('shared.update')
    else 
      render :edit , notice:  t('shared.failure_new') 
    end
  end
  def edit

  end
  def show 
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: '削除しました'
  end
  def search
    @tasks = Task.all
    @q = Task.ransack(params[:q])
    @events = @q.result(distinct: true).order(support_at: :asc)
  
  end
  def week_calender
    @events = Task.all
  end
  
  def sales
    @tasks = Task.all
    @q = Task.ransack(params[:q])
    @events = @q.result(distinct: true).order(support_at: :desc)
  end
  def task_search
    @tasks = Task.all
    @q = Task.ransack(params[:q])
    @events = @q.result(distinct: true).order(support_at: :desc)
  end
  private
  def set_search
    @q = Task.includes(:properties).ransack(params[:q])
    @results = @q.result.includes(:properties)
  end
  def task_params
    params.require(:task).permit(:id,:name, :dispatch,:category, :content, :support_at, :confirmation,:step,
      :vehicle, :start_time, :end_time, :sales_check, :admin_check, :sales, :created_at, :updated_at,:user_id,
      users_attributes:[:id,:task_id],
      properties_attributes:[:id, :name, :zip, :prefecture, :city , :address, :tel,:_destroy ],
      agents_attributes:[:id, :manager_name, :name, :zip, :prefecture, :city, :address, :_destroy],
      task_partners_attributes:[:id, :task_id, :partner_id, :_destroy],
      partners_attributes:[{id:[]}, :name, :worker, :contact, :sales, :_destroy],
      front_managers_attributes:[:id, :manager, :support_at, :office_hours, :content, :sales, :_destroy],
      workers_attributes:[:id, :name, :_destroy ],
      task_workers_attributes:[:id, :task_id, :worker_id, :_destroy],
      customers_attributes:[:id, :name,:room_number, :zip, :address, :tel, :prefecture, :_destroy ],
      claims_attributes:[:id, :troubled_at, :category, :support_content]
    )
  end
  def set_task
    @task = Task.find(params[:id])
    
  end
  def set_show
    params.permit(:name, :dispatch,
    properties_attributes:[:name, :zip, :prefecture, :city , :address, :tel, :_destroy ],
    partners_attributes:[{id:[]}, :name, :worker, :contact, :sales, :_destroy],
    agents_attributes:[:id, :manager_name, :name, :zip, :prefecture, :city, :address, :_destroy]
  )
  end

  def check_user
    redirect_to tasks_path, notice: '伝票作成者以外はアクセスできません' if @task.user_id != current_user.id
  end
 
end