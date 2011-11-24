class MembersController < ApplicationController
  def index
    @members = Member.find(:all)
  end
end
