class LikesController < ApplicationController
  before_action :load_resource

  def create
    current_user.like!(@resource)
  end

  def destroy
    current_user.dislike!(@resource)
  end

  private

  def load_resource
    @resource = resource_klass.find(params[:likeable_id])
  end

  def resource_klass
    params[:likeable_type].constantize
  end
end
