pragma solidity ^0.4.4;
  
contract GruntFund {

    bytes32 constant NOMINAL_CURRENCY = "USD";
    uint constant MULTIPLIER_NONCASH_PER100 = 200;
    uint constant MULTIPLIER_CASH_PER100 = 400;
    uint16 royaltyRate_per10000 = 500;
    uint32 findersFee_cutoff = 0;
    uint16 findersFee_preCutoffRate_per10000 = 0;
    uint16 findersFee_postCutoffRate_per10000 = 0;
    bytes32 teamName;
    uint pieSlices = 0;
    uint wellValue = 0;

    address constant NO_ACCOUNT = address(0);
    int24 constant NO_TIMESTAMP = int24(0);
    int16 constant MAX_DURATION = int16(4193280); // 8 years.
    uint constant GLOBAL_TIME_UNIT = 1 minutes;
    
    uint constant WorkEntry_TOOLONG = 1020; // 17 hours without clocking out.
    struct WorkEntry {
        int24 timestamp; // Date-time when this info was submitted.
        int24 start;     // Start of this continuous timespan of work.
        int16 duration;  // Duration of work.
        int16 baseRate;  // Theoretical hourly wage for this timespan.
    }
    
    address[] teamMemberAccounts;

    enum UserRole { Owner, Employee, Executive, Advisor }
    struct TeamMember {
        bytes32 name;
        bytes32 email_localPart;
        bytes32 email_domain;
        uint wage;
        UserRole role;

        address controllingAccount; // Ethereum acct of this grunt.
        
        // (Hashes of) 32-byte chunks of Personally Identifiable Information (PII)
        // It is forced to be a collection of 32-byte chunks instead of an
        // arbitrary string (with arbitrary length) in order for this data to be
        // less sensitive to choice of ordering and whitespace.  This should make
        // it easier for a grunt to guess the correct values that will hash to
        // these values in case they don't have computer files on-hand.
        bytes32[] identification;
        
        // Trusted third-party account authorized to change the controlling
        // account (subject to preconditions), in case this grunt loses the use
        // of the controlling account.
        address recoveryAccount;
        
        // Using mapping to manually implement array instead of using array type,
        // so that we will be able to delete large portions off the beginning of
        // the array without having to move the entire contents forward to fill
        // in the empty slots.  Besides, for arrays within contract storage, the
        // underlying implementation is as a mapping from uint to element anyway.
        mapping (uint => WorkEntry) WorkLog;
        uint WorkLog_firstIndex;
        uint WorkLog_nextIndex;
        
        uint paidIntoWell;
        uint totalPayReceived;
    }
    
    enum ContributionType {
        Time,
        PersonalCar,
        Expenses,
        Supplies,
        Equipment,
        Sales,
        Royalty,
        Facilities,
        FindersFee,
        Other
    }
    
    function GruntFund(uint totalPie_, uint wellBalance_) public {
    }

    function addFundsToWell(uint amount) external {
    }

    function drawFundsFromWell(uint amount) external {
    }

    function addTeamMember(
        bytes32 name_,
        bytes32 email_localPart_,
        bytes32 email_domain_,
        uint fairMarketSalary,
        UserRole role_
    ) external {
    }

    function addContribution() external {
    }

}

