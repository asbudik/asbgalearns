class SitesController < ApplicationController
respond_to :html, :json

  # before_action :nokogiri_soups, :nokogiri_trucks
  def index
    nokogiri_soups
    xml_bart
    json_weather

    @gaCourses = Workshop.all.order(created_at: :asc)

    @user = User.new
    @shoutout = Shoutout.new
    @like = Like.new

    @GA_SF = TWITTER_CLIENT.user_timeline('GA_SF')
    @foodtruck = TWITTER_CLIENT.user_timeline('gloungesf')

    @shoutouts_all = Shoutout.all.order(created_at: :desc).take(15)

    @current_user = User.find_by_id(session[:id])

  end
  def show
    @current_user = User.find_by_id(session[:id])

    # @button1 = @@button1
    # respond_with @button1
  end

  def nokogiri_soups
    urlSoups = open('http://www.specialtys.com/Location.aspx?Store=SF09#TodaysSoups').read

    # Nokogiri is the module name, HTML is the class name
    pageSoups = Nokogiri::HTML(urlSoups)
    @soups = []

    @soups = pageSoups.css('a.soupSelection').map do |soup|
     {name: soup.text.strip }
    end
  end

    def xml_bart
      xmlfile = open('http://api.bart.gov/api/etd.aspx?cmd=etd&orig=MONT&key=MW9S-E7SL-26DU-VV8V').read
      @bartTimes = Crack::XML.parse(xmlfile)['root']
      @trains = []
      @new_time = []


      # @current_time = Time.now.strftime("%B %e, %l:%M %p")
      @new_time = @bartTimes['time'].split(/:\w+ /)
      @current_time = "#{@new_time[0]} #{@new_time[1]}"
      @trains = @bartTimes['station']['etd']

  end

  def json_bart
    xmlfile = open('http://api.bart.gov/api/etd.aspx?cmd=etd&orig=MONT&key=MW9S-E7SL-26DU-VV8V').read
    respond_to do |format|
      format.json { render json: Crack::XML.parse(xmlfile)['root'].to_json }
    end
  end

  def json_weather
    jsonfile = open('http://api.openweathermap.org/data/2.5/weather?lat=37.786958&lon=-122.394462&APPID=83af9702560d192859e957e1e00ed980').read
    @weather = Crack::JSON.parse(jsonfile)
    @tempmath = (((@weather["main"]["temp"] - 273)* 1.8 )+ 32) - 7
    @temp = @tempmath.to_s.split(".")[0]



  end

end
