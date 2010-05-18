describe User do
  before(:each) do
    @user = User.new
  end

  after(:each) do
    # this is here as an example, but is not really necessary
    # since each example is run in its own object, instance variables
    # go out of scope between each example
    @user = nil
  end
end
