class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    item.save
    # 4. トップ画面へリダイレクト
    redirect_to admin_item_path(item.id)
  end



  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price)

  end


end
