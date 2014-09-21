class ContainersController < ApplicationController

  def start
    ContainerStateChangeJob.perform_later container, 'start'
    redirect_to root_path, notice: 'The container has been started'
  end

  def stop
    ContainerStateChangeJob.perform_later container, 'stop'
    redirect_to root_path, notice: 'The container has been stopped'
  end

  def freeze
    ContainerStateChangeJob.perform_later container, 'freeze'
    redirect_to root_path, notice: 'The container has been frozen'
  end

  def unfreeze
    ContainerStateChangeJob.perform_later container, 'unfreeze'
    redirect_to root_path, notice: 'The container has been unfrozen'
  end

  def delete
    ContainerStateChangeJob.perform_later container, 'delete'
    redirect_to root_path, notice: 'The container has been deleted'
  end

  private

  def container
    Container.find(params[:id])
  end

end
