# Pendubot
Files from my Pendubot project. 

I don't really know whether I'm proud of this one. On one hand, it was all done in the timespan of a week (actually 3 days, since I had other projects that were due in a really close timeframe), on the other hand, my swing-up controller is reaaaally not robust and is basically a glorified PID with feedback linearization.
Some of my personal comments on this one: 

- The swing-up controller is an ad-hoc feedback-linearized PID tuned to deliver the system to a state which can be captured by the attraction basin of the other controller, which I call: the stabilizer (the one that keeps the the double pendulum in an upright position once it reaches a suficiently close state)
- The stabilizer is a Linear Quadratic Regulator designed from the model linearized around the linearized upright state
- Every result comes from ideal simulation only, that means that the controller in its present iteration would need significant tweaking in a practical implementation to achieve some satisfying result, or it may not even work at all. This is, as I see it, a major consequence of the poor swing-up design (but come on, I only had one week)
- My local folder for this project was unironically a mess, I salvaged what I could from the files and posted them here
- My report for this project is in the "trabalho_pendubot.pdf" file, in Portuguese

