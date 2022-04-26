class Arguments
  @original_image_path
  @final_image_path
  @text
  @font
  @fill_color
  @under_color
  @point_size
  @gravity

  attr_accessor :original_image_path
  attr_accessor :final_image_path
  attr_accessor :text
  attr_accessor :font
  attr_accessor :fill_color
  attr_accessor :under_color
  attr_accessor :point_size
  attr_accessor :gravity

  def initialize(
    original_image_path,
    final_image_path,
    text,
    font,
    fill_color,
    under_color,
    point_size,
    gravity)

    @original_image_path = original_image_path
    @final_image_path = final_image_path
    @text = text
    @font = font
    @fill_color = fill_color
    @under_color = under_color
    @point_size = point_size
    @gravity = gravity
  end
end
