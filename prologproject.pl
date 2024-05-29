

% Define diseases and their associated symptoms
disease(cold, [runny_nose, sneezing, sore_throat]).
disease(flu, [fever, headache, body_ache, chills, cough]).
disease(allergy, [sneezing, itchy_eyes, runny_nose, itchy_throat]).
disease(strep_throat, [sore_throat, fever, swollen_lymph_nodes]).
disease(bronchitis, [cough, mucus, fatigue, shortness_of_breath]).

% Ask the user about their symptoms
ask_symptom(Symptom) :-
    format('Do you have ~w? (yes/no) ', [Symptom]),
    read(Response),
    (Response == 'yes').

% Diagnose the user's condition
diagnose :-
    findall(Disease, (disease(Disease, Symptoms), \+ (\+ (member(Symptom, Symptoms), ask_symptom(Symptom)))), Diseases),
    (   length(Diseases, 1) -> format('You may have ~w.~n', [Diseases]);
        Diseases == [] -> format('Diagnosis unknown. Please consult a doctor.~n');
        format('You may have one of the following: ~w.~n', [Diseases])
    ).

% Run the diagnosis
?- diagnose.
