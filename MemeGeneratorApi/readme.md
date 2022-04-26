# Meme Generator API

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

Perform HTTP requests to the following endpoints

### Generate meme
POST <server_url>/memes
```
{
    "original_image_path": "hey",
    "final_image_path": "hey",
    "text": "hey",
    "font": "hey",
    "fill_color": "hey",
    "under_color": "hey",
    "point_size": "hey",
    "gravity": "hey"
}
```

Returns 303, redirects to an image of the generated meme.
