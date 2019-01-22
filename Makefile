run: run.o driver.o acdc.o system.o vode.o vodea.o
	gfortran -O3 $^ -o $@

run.o: run_acdc.f90 system.o driver.o
	gfortran -O3 -g -fcheck=all -Wall  -c $< -o $@

driver.o: driver_acdc.f90 system.o 
	gfortran -O3 -c $< -o $@

acdc.o: acdc_equations292K_2.f90 
	gfortran -O3 -c $< -o $@

system.o: acdc_system292K.f90
	gfortran -O3 -c $< -o $@

vode.o: vode.f
	gfortran -std=legacy -O3 -c $< -o $@

vodea.o: vodea.f
	gfortran -std=legacy -O3 -c $< -o $@

.PHONY: clean

clean:
	rm -f *.o *.mod run
