sample_man = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/man.wav'
sample_woman = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/woman.wav'
sample_sitzung_begruessung = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_begruessung.wav'
sample_sitzung_eroeffnet = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_eroeffnet.wav'
sample_sitzung_glocke = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samples/sitzung_glocke.wav'
trumpets = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/NoBudgetOrch2/Trumpet/TrumpetSect/Sustain/'
cellotrem = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/NoBudgetOrch2/Cello/CelloSect/Tremulo/'
violintrem = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/NoBudgetOrch2/Violin/ViolinSect/Tremulo'
cello2 = '/Users/simon/Documents/projects/nzz_zh_kantonsrat_genderstudy_sonofication/samplesext/Virtual-Playing-Orchestra3/libs/VSCO2-CE/Strings/Cello Section/spic'

data = ['m', 'm', 'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm',
        'm', 'm', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'm',
        'm', 'm', 'w', 'w', 'w', 'm', 'm', 'm', 'm', 'w',
        'w', 'm', 'w', 'm', 'm', 'm', 'm', 'm', 'w', 'w',
        'w', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'w',
        'm', 'm', 'w', 'm', 'm', 'w', 'm', 'm']
set :count_factor, 20
set :count_m, 0.0
set :count_w, 0.0
set :globalamp, 1
set :bassamp, 1
set :bpm, 100
set :endofsong, 0
set :ampmultiplyer, 0

use_bpm get[:bpm]

# Drums
in_thread do
  176.times do
    sample :drum_cymbal_closed
    sleep 0.5
  end
end

#live_loop :drums do
in_thread do
  11.times do
    
    sample :drum_cymbal_open
    3.times do
      sample :drum_heavy_kick
      sleep 1
      sample :drum_snare_hard
      sleep 1
    end
    
    sample :drum_heavy_kick
    sleep 0.8
    sample :drum_snare_hard
    sleep 0.2
    sample :drum_snare_hard
    sleep 0.5
    sample :drum_snare_hard
    sleep 0.5
  end
  
end

# Bass
live_loop :bass do
  
  amp = get[:bassamp]
  use_synth :fm
  play :c2, amp: amp
  sleep 1
  play :ef2, amp: amp + 2
  sleep 1
  play :d2, amp: amp
  sleep 1
  play :cs2, amp: amp
  sleep 1
  
  play :c2
  sleep 1
  play :ef2, amp: amp + 2
  sleep 0.75
  play :ef2, amp: amp
  sleep 0.25
  play :d2, amp: amp
  sleep 0.25
  play :d2, amp: amp
  sleep 0.25
  play :d2, amp: amp
  sleep 0.5
  play :cs2, amp: amp
  sleep 0.5
  play :cs2, amp: amp
  sleep 0.5
  
  stop if get[:endofsong] == 1
end

in_thread do
  loop do
    sync :tick
    x = get[:position]
    
    # Men
    if data[x] == 'm'
      rate_m = 1 + get[:count_m] / get[:count_factor]
      sample sample_man, rate: rate_m, amp: 1 + get[:count_m] / 4 + get[:ampmultiplyer]
      set :count_m, get[:count_m] + 1
      
      # Women
    elsif data[x] == 'w'
      rate_w = 1 + get[:count_w] / get[:count_factor]
      sample sample_woman, rate: rate_w, amp: 1 + get[:count_m] / 4 + get[:ampmultiplyer]
      set :count_w, get[:count_w] + 1
      
    end
  end
end

define :begruessung do
  sample sample_sitzung_begruessung, amp: 4
  sleep 13
  sample sample_sitzung_glocke, amp: 6
end

define :rundata do |from, to|
  count = 0
  for x in from..to
    set :position, x
    cue :tick
    
    if x % 16 == 0
      set :bpm, get[:bpm] + 10
    end
    sleep 2
  end
end

define :rundata2time do |from, to|
  count = 0
  for x in from..to
    set :position, x
    cue :tick
    sleep 1
  end
end

define :bassbeforetrumpet do | frombeat |
  in_thread do
    loop do
      sync :tick
      if get[:position] == frombeat
        4.times do
          sample :drum_cymbal_open
          sample :drum_snare_hard
          sample :drum_heavy_kick
          sleep 0.25
          sample :drum_cymbal_closed
          sleep 0.25
          sample :drum_cymbal_closed
          sleep 0.25
          sample :drum_cymbal_closed
          sleep 0.25
        end
        
        4.times do
          sample :drum_cymbal_open
          sample :drum_snare_hard
          sample :drum_heavy_kick
          sleep 0.5
        end
        
        8.times do
          sample :drum_snare_hard
          sample :drum_cymbal_open
          sleep 0.25
        end
      end
    end
  end
end

define :trumpet do
  
  define :cellodiss do
    in_thread do
      8.times do
        sample cello2, "C1_v2_RR2", amp: 3
        sample cello2, "spic_B1_v2_RR2", amp: 3
        sleep 0.5
      end
    end
  end
  
  define :trumpet_up do
    sample trumpets, "4_C", attack: 0, start: 0, release: 3.1, finish: 0.4, amp: 2
    sleep 3
    sample trumpets, "4_Eb", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sleep 0.25
    sample trumpets, "4_G", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sleep 0.25
    sample trumpets, "5_C", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sleep 0.25
    sample trumpets, "5_E", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sleep 0.25
    
  end
    
  # First
  cellodiss
  trumpet_up
  
  sample trumpets, "5_G", attack: 0, start: 0, release: 2.5, finish: 0.4, amp: 4
  sample trumpets, "3_G", attack: 0, start: 0, release: 2.5, finish: 0.4, amp: 4
  sample trumpets, "4_Bb", attack: 0, start: 0, release: 2.5, finish: 0.4, amp: 4
  
  sleep 2
  sample trumpets, "5_Eb", attack: 0, start: 0, release: 2.5, finish: 0.3, amp: 4
  sample trumpets, "5_C", attack: 0, start: 0, release: 2.5, finish: 0.3, amp: 4
  sample trumpets, "4_G", attack: 0, start: 0, release: 2.5, finish: 0.23, amp: 4
  sleep 2
  
  # Second
  cellodiss
  trumpet_up
  
  sample trumpets, "5_B", attack: 0, start: 0, release: 2.5, finish: 0.4, amp: 4
  sample trumpets, "4_G", attack: 0, start: 0, release: 2.5, finish: 0.4, amp: 4
  
  sleep 2
  
  sample trumpets, "5_C", rate: 2, amp: 4
  sample trumpets, "4_G", attack: 0, start: 0, release: 2.5, finish: 0.3, amp: 4
  sample trumpets, "4_C", attack: 0, start: 0, release: 2.5, finish: 0.3, amp: 4
  
end


# Bass
set :bassamp, 3
sleep 16

# Begrüssung
set :bassamp, 1
begruessung
set :bassamp, 3
sleep 3

# Data
set :bassamp, 1
bassbeforetrumpet 16
rundata 0, 19

# Trumpet Intermezzo
set :bassamp, 1
trumpet

set :bassamp, 3

sleep 18


8.times do
  sample :drum_cymbal_soft
  sleep 0.5
  sample :drum_cymbal_soft
  sleep 0.3
  sample :drum_cymbal_soft
  sleep 0.2
end


# ========================= 2. VERSE


in_thread do
  10.times do
    sample :drum_cymbal_open
    sleep 0.5
    sample :drum_cymbal_soft
    sleep 0.3
    sample :drum_cymbal_soft
    sleep 0.2
    3.times do
      sample :drum_cymbal_soft
      sleep 0.5
      sample :drum_cymbal_soft
      sleep 0.3
      sample :drum_cymbal_soft
      sleep 0.2
    end
  end
end



set :count_m, 0.0
set :count_w, 0.0

in_thread do
  sleep 12
  in_thread do
    54.times do
      sample cello2, "C1_v2_RR2", amp: 3
      sample cello2, "spic_B1_v2_RR2", amp: 3
      sleep 0.5
    end
  end
end

in_thread do
  sleep 16
  
  use_synth :prophet
  in_thread do
    6.times do
      play_pattern_timed ['C4', 'Eb4', 'G4', 'D4', 'B3', 'B4', 'D4', 'F5'], 0.5, release: 1, amp: 1
    end
  end
end

in_thread do
  sleep 28
  for x in 0..5
    
    sample trumpets, "4_C", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "4_Eb", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sample trumpets, "4_G", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "5_B", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    
    
    sleep 0.5
    
    sample trumpets, "4_C", attack: 0, start: 0, release: 0.1, finish: 0.13, amp: 2
    sample trumpets, "4_Eb", attack: 0, start: 0, release: 0.1, finish: 0.21, amp: 2
    sample trumpets, "4_G", attack: 0, start: 0, release: 0.1, finish: 0.13, amp: 2
    sample trumpets, "5_B", attack: 0, start: 0, release: 0.1, finish: 0.13, amp: 2
    
    sleep 1
    
    sample trumpets, "4_C", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "4_Eb", attack: 0, start: 0, release: 0.1, finish: 0.1, amp: 2
    sample trumpets, "4_G", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    sample trumpets, "5_B", attack: 0, start: 0, release: 0.1, finish: 0.05, amp: 2
    
    sleep 0.5
  end
end

set :ampmultiplyer, 3
rundata2time 20, 60
set :endofsong, 1







