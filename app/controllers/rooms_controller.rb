class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    @room.host_id = current_user.id

    if @room.save
      redirect_to room_path(@room.id)
    else
      @errors = @room.errors.keys.map { |key|[key, @room.errors.full_messages_for(key)]}.to_h
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(
      :image,
      :title,
      :description,
      category_ids:[]
    )
  end
end
