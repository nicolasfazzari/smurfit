class IndicatorsController < ApplicationController
	def index
		@indicators = Indicator.all.order('created_at DESC')
		@charts=[]
		@indicators.each do |indicator|
			
			@chart = LazyHighCharts::HighChart.new('graph') do |f|
					  

					  	serie = (indicator.data.split("\n"))
					  	x = serie.first.split(',').map(&:to_s)
					  	serie.drop(1).each do |serie|
					  		data= serie.split(',').map(&:to_i).drop(1)
					  		name= serie.split(',').map(&:to_s).first
					  		graph = indicator.graph.split('_').map(&:to_s).last
					  		if name.upcase=='OBJECTIF'
					  			puts f.series(type: 'line', name: name , yAxis: 0, data: data, color: '#ff5050')
					  		else 
					  			puts f.series(name: name , yAxis: 0, data: data)
					  		end
					  		
					  	end

					  	if (indicator.graph == "stacked_bar") || (indicator.graph =="stacked_column") || (indicator.graph =="stacked_area")
					  		f.plotOptions(series: {stacking: 'normal',dataLabels: {enabled: 'true',color: '#FFFFFF'}})
					  	else
					  		f.plotOptions(series: {dataLabels: {enabled: 'true'}})
						end
					 
					  f.title(text: indicator.name)
					  f.xAxis(categories: x)

					  f.yAxis [
					    {title: {text: indicator.yaxis, margin: 70} },
					  ]

					  f.legend(align: 'center', verticalAlign: 'bottom', y: 0, x: 0, layout: 'horizontal')
					  f.chart({defaultSeriesType: indicator.graph.split('_').map(&:to_s).last})
			end
			
			@charts.push(instance_variable_set(:"@#{indicator.name.gsub(" ","_")}", @chart))
		end
		

	end

	def new
		@indicator = Indicator.new
	end

	def create
		@indicator = Indicator.new(indicator_params)
		if @indicator.save
			redirect_to @indicator
		else
			render 'new'
		end
	end

	def show
		@indicator = Indicator.find(params[:id])

	end

	def edit
		@indicator = Indicator.find(params[:id])
		respond_to do |format|
		    format.html  #If it's a html request this line tell rails to look for new_release.html.erb in your views directory
		    format.js #If it's a js request this line tell rails to look for new_release.js.erb in your views directory
		  end
		
	end

	def update
		@indicator = Indicator.find(params[:id])

		if @indicator.update(params[:indicator].permit(:name, :data, :graph, :xaxis, :yaxis))
			redirect_to root_path
		else
			render 'edit'
		end
	end


	def destroy
		@indicator = Indicator.find(params[:id])
		@indicator.destroy
		redirect_to root_path
	end

	private
		def indicator_params
			params.require(:indicator).permit(:name, :data, :graph, :xaxis, :yaxis)
		end
end
