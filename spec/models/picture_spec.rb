require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Picture do
  describe "polymorphic associations" do
    before do
      @user = User.create!(email: "ts3@example.com")
      @agency = Agency.create
    end
    it "should associate polymorphically with users" do
      picture = @user.pictures.create(:image => "somefile.jpg")
      picture.imageable.should == @user
    end
  end
end
