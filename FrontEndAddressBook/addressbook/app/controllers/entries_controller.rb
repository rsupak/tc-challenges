class EntriesController < ApplicationController
  before_action :find_id, only: %i[show update destroy edit]

  def index
    @entries = Entry.all
  end

  def show; end

  def new
    @entry = Entry.new
  end

  def edit; end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry
    else
      render 'edit'
    end
  end

  def destroy
    @entry.destroy

    redirect_to entries_path
  end

  def import
    Entry.import(params[:file])
    redirect_to root_url, success: "Entries Imported!"
  end

  private

  def find_id
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:firstname, :lastname, :phone, :email)
  end
end
