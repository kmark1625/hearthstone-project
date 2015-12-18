get "/cards/sets/all" do
  @cards = Card.all
  @page_num = 1
  @set_name = "all"
  erb :"cards/show"
end

get "/cards/sets/:set_name/:page_num" do
  if params[:set_name] == "all"
    @cards = Card.all
  else
    @cards = Card.select_set(params[:set_name])
  end
  @page_num = params[:page_num]
  @set_name = params[:set_name]
  erb :"cards/show"
end

get "/cards/sets/:set_name" do
  @page_num = 1
  @set_name = params[:set_name]
  @cards = Card.select_set(params[:set_name])
  erb :"/cards/show"
end

get "/cards/:card_id" do
  @card = Card.find_by(id: params[:card_id])
  erb :"/cards/show_card"
end

get "/cards/:card_id/edit" do
  @card = Card.find_by(id: params[:card_id])
  erb :"/cards/edit"
end

delete "/cards/:card_id" do
  if current_user && current_user.admin
    card = Card.find_by(id: params[:card_id])
    card.destroy
    redirect "/cards/sets/all"
  end
end
