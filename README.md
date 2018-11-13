# Rainbow Vomit
The stupid simple WS2812 driver

## Why?
I wanted to drive WS2812 LEDs from a computer. For some reason that's not a solved problem?

## What?
Pixels get clocked at 800 kbps, and each pixel is 24 bits.
If you want a 30 Hz refresh rate, you should be able to drive smooth video to a strand of 1024 pixels.

I want a USB interface, and USB FS can do 12 mbps. So that means I should be able to run about 8 channels at 800 kbps with some room for overhead.

So I should be able to run smooth video on a 8192 LED setup without even diving into high speed USB.

For some reason, most simple drivers can't come close to these specs. Respect for the [Pixel Pusher](http://www.heroicrobotics.com/products/pixelpusher) though, it's just large, expensive, and uses Ethernet.

## How?
I think I can trick the STM32F105 into doing this for me. It's gonna take a lot of fiddling with the DMA engine, but I'm confident I can extend the approach [here](https://github.com/ervanalb/lux/blob/master/led_strip_firmware/app/src/ws2811_strip.c) to 8 channels (that example works plenty fast on a F0 at 48 MHz).

## Anything else?
Why yes, thanks for asking.

You may not want your display topology to require daisy-chaining LEDs together until you reach 1000 pixels.
So, I'm going to make a multiplexer board that splits a single channel into N strips.
It will distribute pixels round-robin to all the connected strips so you can use more of a star topology in your setup.
This will operate entirely on the WS2812 protocol, so you can use any driver, not just mine.

I also find it weird that this doesn't exist yet.

## And then what?
Maybe Adafruit or Sparkfun will steal my design and mass produce it. That would be cool.
