class ListsController < ApplicationController
  before_action :find_list, only: %i[show]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save!
    redirect_to lists_path
  end

  def show
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
