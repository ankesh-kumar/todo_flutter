class SliderModel{
  String title;
  String desc;
  String imageAssetPath;

  SliderModel({this.title, this.desc});

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
}

List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setTitle('Welcome to Clear');
  sliderModel.setDesc('Tap or swipe to begin');
  sliderModel.setImageAssetPath('assets/onBoarding/shopping-bag.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Clear sorts items by priority');
  sliderModel.setDesc('Important items are highlighted at the top....' );
  sliderModel.setImageAssetPath('assets/onBoarding/shopping-bag.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Tap and hold to pick an item up');
  sliderModel.setDesc('Drag it up or down to change its priority.');
  sliderModel.setImageAssetPath('assets/onBoarding/search.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('There are three navigation levels...');
  sliderModel.setDesc('');
  sliderModel.setImageAssetPath('assets/onBoarding/payment.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Pinch together vertically to ');
  sliderModel.setDesc('collapse your current level and navigate up.');
  sliderModel.setImageAssetPath('assets/onBoarding/products-delivery.png');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setTitle('Tap on a list to see its content.');
  sliderModel.setDesc('Tap on a list title to edit it...');
  sliderModel.setImageAssetPath('assets/onBoarding/premium-quality.png');
  slides.add(sliderModel);

  return slides;
}