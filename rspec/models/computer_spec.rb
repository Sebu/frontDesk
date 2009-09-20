
require 'vendor/indigo'

describe Computer do

  before :all do
    @computer = Computer.find("c11")
    p @computer
  end 

  it "should list registered users" do
    @computer.user = "hans franz"
    @computer.user_list.should == ["hans", "franz"]
  end   
  
  it "should format registered users into #user string" do
    @computer.user_list = ["hans", "franz"]
    @computer.user.should == "hans franz"
  end   

  it "should add user 'tim' to list ['hans' 'franz'] " do
    @computer.user_list = ['hans franz']
    @computer.user_list.should == ["hans", "franz"]
    @computer.user.should == "hans franz"       
    @computer.user_list += ['tim']
    @computer.user_list.should == ["hans", "franz", "tim"]
    @computer.user.should == "hans franz tim"    
  end
  
  it "should update timestamp" do
    old_time = @computer.time
    @computer.user_list = ['franz']
    @computer.save
    @computer.time.should > old_time
  end  
  
  it "should #remove_user('tim')" do
    @computer.user_list = ["hans", "tim" , "franz"]
    @computer.remove_user("tim")
    @computer.user.should == "hans franz"
    @computer.user_list.should == ["hans", "franz"]

  end   


end
