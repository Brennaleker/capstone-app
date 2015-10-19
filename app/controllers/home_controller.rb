require 'httparty'

class HomeController < ApplicationController

  def index
    users
    volunteers
    organizations
    projects
    gifts
  end

  def profile
    retrieve_profile
  end

  private

  def users
    @users_result = HTTParty.get('http://localhost:3001/users')
  end

  def volunteers
    @volunteers_result = HTTParty.get('http://localhost:3001/volunteers')
    @volunteer_count = @volunteers_result.count
    @volunteers_pending = HTTParty.get('http://localhost:3001/volunteers/pending')
  end

  def organizations
    @organizations_result = HTTParty.get('http://localhost:3001/organizations')
    @organizations_count = @organizations_result.count
  end

  def projects
    @projects_result =  HTTParty.get('http://localhost:3001/projects')
    @projects_pending =  HTTParty.get('http://localhost:3001/projects/pending')
    @projects_approved =  HTTParty.get('http://localhost:3001/projects/pending')
    @projects_funded =  HTTParty.get('http://localhost:3001/projects/funded')
    @funded_count = @projects_funded.count
  end

  def gifts
    @gifts_result = HTTParty.get('http://localhost:3001/gifts')
    @donations_count = @gifts_result.count
  end

  # def retrieve_profile =
  #   @user_result = HTTParty.get('http://localhost:3001/user/:id')
  # end
end
