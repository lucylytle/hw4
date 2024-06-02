class EntriesController < ApplicationController
  
  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]
    @entry.uploaded_image.attach(params["uploaded_image"])
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

  def destroy
    # find a Entry
    @entry = Entry.find_by({ "id" => params["id"] })
  
    # destroy Entry row
    @entry.destroy
  
    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
    end 


end
