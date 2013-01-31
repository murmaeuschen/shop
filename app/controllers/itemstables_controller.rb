class ItemstablesController < ApplicationController
  # GET /itemstables
  # GET /itemstables.json
  def index
    @itemstables = Itemstable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itemstables }
    end
  end

  # GET /itemstables/1
  # GET /itemstables/1.json
  def show
    @itemstable = Itemstable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itemstable }
    end
  end

  # GET /itemstables/new
  # GET /itemstables/new.json
  def new
    @itemstable = Itemstable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itemstable }
    end
  end

  # GET /itemstables/1/edit
  def edit
    @itemstable = Itemstable.find(params[:id])
  end

  # POST /itemstables
  # POST /itemstables.json
  def create
    @itemstable = Itemstable.new(params[:itemstable])

    respond_to do |format|
      if @itemstable.save
        format.html { redirect_to @itemstable, notice: 'Itemstable was successfully created.' }
        format.json { render json: @itemstable, status: :created, location: @itemstable }
      else
        format.html { render action: "new" }
        format.json { render json: @itemstable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itemstables/1
  # PUT /itemstables/1.json
  def update
    @itemstable = Itemstable.find(params[:id])

    respond_to do |format|
      if @itemstable.update_attributes(params[:itemstable])
        format.html { redirect_to @itemstable, notice: 'Itemstable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itemstable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemstables/1
  # DELETE /itemstables/1.json
  def destroy
    @itemstable = Itemstable.find(params[:id])
    @itemstable.destroy

    respond_to do |format|
      format.html { redirect_to itemstables_url }
      format.json { head :no_content }
    end
  end
end
