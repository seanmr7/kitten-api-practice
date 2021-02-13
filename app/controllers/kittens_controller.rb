class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "New kitten added!"
      redirect_to @kitten
    else
      render :new
    end
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated!"
      redirect_to @kitten
    else
      render :edit
    end
  end

  def delete
    @kitten.destroy

    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
