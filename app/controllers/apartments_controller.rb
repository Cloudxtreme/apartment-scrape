class ApartmentsController < ApplicationController
  before_filter :apply_filters, :only => [:index, :map]
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]

  def index
    #@apartments = Apartment.all
  end

  def map
    #@apartments = Apartment.all
  end

  def show
  end

  def new
    @apartment = Apartment.new
  end

  def edit
  end

  def create
    @apartment = Apartment.new(params[:apartment])

    if @apartment.save
      redirect_to(@apartment, :notice => 'Apartment was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @apartment.update_attributes(params[:apartment])
      redirect_to(@apartment, :notice => 'Apartment was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @apartment.ignore = true
    @apartment.save
  end

  private

  def apply_filters
    filters = [{:ignore => false}]
    filters << {:cats => parse_boolean(params[:cats])} if params[:cats]
    filters << "address NOT NULL" if params[:address]
    filters << ['price < ?', params[:max_price]] if params[:max_price]

    apts = (filters.inject(Apartment) {|memo,fltr| memo.where(fltr)})
    @apartments = apts.order(parse_sort(params[:sort]))
  end

  def load_resource
    @apartment = Apartment.find(params[:id])
  end

  def parse_boolean(val)
    val == 'Y'
  end

  def parse_sort(sort)
    sort ? sort : 'id ASC'
  end
end
