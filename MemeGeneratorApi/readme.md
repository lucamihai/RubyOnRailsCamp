# Meme Generator API

## Setup

You'll need to install [GraphicsMagick](http://www.graphicsmagick.org/), then restart your computer. 

## Starting the server

Run the following command in a terminal.
```
rackup
```

You could also specify a port by providing it as an argument
```
rackup -p <port>
```

## Usage

Perform HTTP requests to the following endpoints:

### Generate meme
POST <server_url>/memes
```
{
    "original_image_path": "images\\meme_templates\\senator_armstrong.jpg",
    "final_image_path": "images\\memes\\the_mother_of_all_omelettes.jpg",
    "text": "Making the mother of all omelettes here Jack.\nCant fret over every egg.",
    "font": "Arial",
    "fill_color": "White",
    "under_color": "Black",
    "point_size": 55,
    "gravity": "Center"
}
```

Returns 303, redirects to an image of the generated meme.
