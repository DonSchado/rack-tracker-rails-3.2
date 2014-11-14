class FoosController < ApplicationController

  def index
    @foos = Foo.all
  end

  def show
    @foo = Foo.find(params[:id])
  end

  def new
    @foo = Foo.new
  end

  def edit
    @foo = Foo.find(params[:id])
  end

  def create
    @foo = Foo.new(params[:foo])

    if @foo.save
      redirect_to @foo, notice: 'Foo was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @foo = Foo.find(params[:id])

    if @foo.update_attributes(params[:foo])
      redirect_to @foo, notice: 'Foo was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @foo = Foo.find(params[:id])
    @foo.destroy
    redirect_to foos_url
  end
end
