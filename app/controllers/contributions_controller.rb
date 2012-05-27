class ContributionsController < ApplicationController
  def create
    parameters = params[:contribution]

    @contribution = Contribution.new(parameters)
    @contribution.user = current_user

    @contribution.save
    redirect_to @contribution.event
  end

  def update
    parameters = params[:contribution]
    @contribution = Contribution.find(params[:id])

    @contribution.update_attributes(parameters)
    redirect_to @contribution.event
  end
end
