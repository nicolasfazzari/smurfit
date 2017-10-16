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
					  		if name.upcase=='OBJECTIF'
					  			puts f.series(type: 'line', name: name , yAxis: 0, data: data)
					  		else 
					  			puts f.series(name: name , yAxis: 0, data: data)
					  		end
					  	end

				
					  f.plotOptions(series: {dataLabels: {enabled: 'true'}})
					 
					  f.title(text: indicator.name)
					  f.xAxis(categories: x)

					  f.yAxis [
					    {title: {text: indicator.yaxis, margin: 70} },
					  ]

					  f.legend(align: 'center', verticalAlign: 'bottom', y: 0, x: 0, layout: 'horizontal')
					  f.chart({defaultSeriesType: indicator.graph})
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
