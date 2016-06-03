class Api::V1::RelationshipsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Relationship.create(params[:class], params[:id], params[:objects])
  end
end
