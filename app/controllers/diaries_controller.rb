class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy] 
 
  def index
    @diaries = Diary.all
  end

  def new
    if params[:back]
      @diary = Diary.new(diary_params)
    else
      @diary = Diary.new
    end
  end
  
  def confirm
    @diary = Diary.new(diary_params)
    render :new if @diary.invalid?
  end
  
  def create
    @diary = Diary.new(diary_params)
    
    if @diary.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to diaries_path, notice: "つぶやき投稿しました！"
    else
      render 'new'
    end
  end
  
  def destroy
    @diary.destroy
    redirect_to diaries_path, notice:"つぶやきを削除しました！"
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  private
  
  def diary_params
    params.require(:diary).permit(:content)
  end
  
  # idをキーとして値を取得するメソッド
  def set_diary
    @diary = Diary.find(params[:id])
  end


end