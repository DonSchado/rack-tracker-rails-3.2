class FoosController < ApplicationController

  def index
    @foos = Foo.all

    tracker do |t|
      t.google_analytics :send, { type: 'event', category: 'foo', action: 'bar', label: 'baz', value: '123456' }
      t.google_analytics :ecommerce, { type: 'addItem', id: '1234', affiliation: 'Acme Clothing', revenue: '11.99', shipping: '5', tax: '1.29' }
      t.facebook :track, { id: '123456789', value: 1, currency: 'EUR' }
    end
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
