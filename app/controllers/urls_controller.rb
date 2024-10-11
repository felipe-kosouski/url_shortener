class UrlsController < ApplicationController
  before_action :set_url, only: [ :show, :edit, :update, :destroy ]

  def index
    @urls = Url.all
  end

  def show
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to url_path @url, notice: "Url successfully created"
    else
      redirect_to new_url_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @url.destroy
    redirect_to urls_path, notice: "Url successfully deleted"
  end

  def visit
    @url = Url.find_by(short_url: params[:short_url])
    if @url
      @url.register_visit
      redirect_to @url.original_url, allow_other_host: true
    end
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
