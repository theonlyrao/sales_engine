class Api::V1::RelationshipsController < ApplicationController
  respond_to :json
  
  def index
    respond_with params[:class].capitalize.camelcase.chomp("s").constantize.find(params[:id]).send(params[:objects])
  end

end
