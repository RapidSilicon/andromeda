NBATCH=10000

train:
	python3 thermal.py --nbatch $(NBATCH) --save thermal.keras --convert --alt alt2 --dataset ./dataset2 --window 1 --dtype 16

test:
	python3 thermal.py --load thermal.keras --test --window 1 --alt alt2

convert:
	python3 thermal.py --load thermal.keras --convert

video:
	ffmpeg -y -framerate 15 -pattern_type glob -i 'gallery/*.jpg' -c:v libx264 -pix_fmt yuv420p out.mp4
