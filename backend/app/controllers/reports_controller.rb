class ReportsController < ApplicationController
    def index
      reports = Report.all
      render json: reports
    end
  
    def create
      @report = Report.new(report_params)
      # @report.user_id = @current_user.id
      @report.recipient_id = params[:recipient_id]

      reported_user = User.find_by(id: params[:recipient_id])
      
      if @report.save
        render json: {report: @report, user: reported_user}, status: :created
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    end
    
  
    def update
      report = Report.find(params[:id])
      if report.update(report_params)
        render json: report
      else
        render json: { errors: report.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      report = Report.find(params[:id])
      report.destroy
      head :no_content
    end
  
    private
  
    def report_params
      params.require(:report).permit(:reason, :recipient_id, :user_id)
    end
  end
  