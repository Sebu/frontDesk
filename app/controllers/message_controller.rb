

class MessageController  < Indigo::Controller

  def show
    render {
      dialog t"sendtext.title" do
      flow {
         check true, t("westsaal")
         check true, t("hauptsaal")
         check false, t("schulungsraum")
      }
      @message_text = textview {
        text t("sendtext.default")
      }
      flow {
        button :cancel, :click => '/hide'
        button t("send"), :click => '/submit'
      }
      end
     }
     show_all
  end
  

  def submit
    puts @message_text.text
  end
  
end


