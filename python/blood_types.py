POSSIBLE_DONORS = {
    "O-": {"O-"},
    "O+": {"O-", "O+"},
    "A-": {"O-", "A-"},
    "A+": {"O-", "A-", "O+", "A+"},
    "B-": {"O-", "B-"},
    "B+": {"O-", "B-", "O+", "B+"},
    "AB-": {"O-", "B-", "A-", "AB-"},
    "AB+": {"O-", "B-", "A-", "O+", "B+", "A+", "AB-", "AB+"},
}


def survive(blood_type, donated_blood):
    possible_donors = POSSIBLE_DONORS.get(blood_type)
    return possible_donors is not None and bool(possible_donors & set(donated_blood))


def test_survive():
    assert survive("B+", ["A-", "B+", "AB+", "O+", "B+", "B-"])
    assert not survive("AB-", ["O+", "AB+"])
