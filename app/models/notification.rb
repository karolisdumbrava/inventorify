class Notification
    attr_reader :message, :type
  
    def initialize(message, type)
      @message = message
      @type = type
    end
  
    def toast_classes
      base_classes = "flex items-center w-full max-w-xs p-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800 fixed top-4 right-4 z-50"
      
      # Update the class assignments with proper syntax
      case type
      when :notice
        base_classes += " border-2 border-green-500"
      when :alert
        base_classes += " border-2 border-red-500"
      end
  
      base_classes
    end
  
    def icon_classes
      base_classes = "inline-flex items-center justify-center flex-shrink-0 w-8 h-8 rounded-lg"
  
      # Update the class assignments with proper syntax
      case type
      when :notice
        base_classes += " text-green-500 bg-green-100 dark:bg-green-800 dark:text-green-200"
      when :alert
        base_classes += " text-red-500 bg-red-100 dark:bg-red-800 dark:text-red-200"
      end
  
      base_classes
    end
  end
  