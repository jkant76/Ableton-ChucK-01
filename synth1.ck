// Synth 1 by jkant
// jkant.blogspot.com
// check out this video demo: http://youtu.be/a7hk31zDIkY
// Synth1.ck
// Comments: a custom public class
// global Synth1 Class
// a 3xOsc synth
public class synth1
{
    // persistent sound chain
    SinOsc s => ADSR env => NRev rev => ResonZ filt => Pan2 pan => dac;
    TriOsc t => env;
    SawOsc sw => env;
    
    // set ADSR env
    ( .05::second, .05::second, .01, .02::second ) => env.set;
    
    // member functions
    fun void setFilter(float f, float Q)
    {
        // filter settings
        f => filt.freq;
        Q => filt.Q => filt.gain;
    }
    
    fun void setReverb(float mix)
    {
        // reverb mix
        mix => rev.mix;
    }
    
    fun void setGain(float g)
    {
        // scale gain for the 3 osc
        g/3 => s.gain => t.gain => sw.gain;
    }
    
    fun void setPan(float p)
    {
        // set pan
        p => pan.pan;
    }
    
    fun void playNote(int noteNum)
    {
        Std.mtof(noteNum) => s.freq => t.freq => sw.freq;
        1 => env.keyOn;
    }
    
}




