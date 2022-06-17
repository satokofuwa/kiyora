class PropertiesController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_search
  before_action :set_property, only: [:destroy,:edit,:update,:show]

  def index
    @properties = Property.all
    @q= Property.ransack(params[:q])
    @properties = @q.result(distinct: true).order(created_at: :desc)
  end

  def new
    @property = Property.new(property_params)
  end

  def create
    #@property = current_user.property.new(property_params)
    flash[:notice] = if @property.save
      '登録が完了しました。'
    else
      'エラーが発生しました。'
    end
    redirect_to new_property_url
  end

  def update
  
    if @property.update(property_params)
      redirect_to properties_path, notice:  t('shared.update')
    else 
      render :edit 
    end
  end

  def edit
    
  end

  def show 
    @task = Task.find(@property.task_id)
    @agent =Agent.find_by(task_id: @property.task_id)
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: 'タスクを削除しました'
  end

  private
  def set_search
    @q = Property.ransack(params[:q])
    @results = @q.result.includes(:tasks)
  end
  def property_params 
    params.require(:property).permit(:name,:tel,:zip,:prefecture,:city)
  end

  def set_property
    @property = Property.find(params[:id])
  end

end