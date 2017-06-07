class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]

  # GET /videos
  def index
    @master = {}
    @master[:msc] = 600
    @findFrom = 0
    @master[:nextUrlPath] = "videos?=bpstart=5" 
    if params[:bpstart] 
      @findFrom = params[:bpstart]
      # console.log(@findFrom)
      @totalVideoCount = Video.totalVideoCount

      @nextOffsetPath = params[:bpstart].to_i + 5
      
      @master[:nextUrlPath] = "videos?=bpstart=" +  @nextOffsetPath.to_s

    end
    if @videos = Video.order(:id).reverse_order.limit(4).offset(@findFrom)
      # @videos.each do |t| 
      #   t[:user] = {}
      #   t[:user_id] = "User.find(t[:user_id])"
      # end
      @master[:msc] = 700

      @master[:blocks] = ActiveModel::ArraySerializer.new(@videos.all, each_serializer: VideoSerializer)



    end
    # @master[:blocks] = @videos 
    # @master[:nextUrlPath] = "//localhost:3000/posts?per_page=1&page=2"
    # render json: @videos, root: @master, adapter: :json

    render json: @master

    # paginate json: @videos

  end

  # GET /videos/1
  def show
    render json: @video
  end

  # POST /videos
  def create
    @video = Video.new(video_params)

    if @video.save
      render json: @video, status: :created, location: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      render json: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_params
      params.permit(:eid, :title, :ty, :videourl, :videoid, :user_id)
    end
end
