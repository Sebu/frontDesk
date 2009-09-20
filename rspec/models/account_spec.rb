
require 'vendor/indigo'

describe Account do

  before :all do
    @account = Account.find_accounts_by_barcode("1111").first
    p @account
  end 

  it "should find accounts with the right barcode" do
    @account.barcode.should == '1111'
  end

  it "should determine the right user type" do
    @account.type.should == :normal
  end

  it "should determine the lock state" do
    @account.locked.should == true
  end    

  it "should know if it #is_private?" do
    @account.is_private?.should == false
  end   
  
end
