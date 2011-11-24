class MembersController < ApplicationController
  def index
    @st_student = Member.find(:all)
  end
end
