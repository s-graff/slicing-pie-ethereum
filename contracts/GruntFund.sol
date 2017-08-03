pragma solidity ^0.4.4;

contract GruntFund {
    // 𝗧𝗘𝗥𝗠𝗜𝗡𝗢𝗟𝗢𝗚𝗬:
    //   𝑭𝑴𝑽 — 𝑭𝒂𝒊𝒓 𝑴𝒂𝒓𝒌𝒆𝒕 𝑽𝒂𝒍𝒖𝒆
    //   𝑨𝒕-𝑹𝒊𝒔𝒌 𝑪𝒐𝒏𝒕𝒓𝒊𝒃𝒖𝒕𝒊𝒐𝒏 — Contribution for which the
    //       contributor is not paid any compensation.  These
    //       contributions are rewarded with "pie" instead.
    //   𝑪𝒂𝒔𝒉 𝑪𝒐𝒏𝒕𝒓𝒊𝒃𝒖𝒕𝒊𝒐𝒏 — 
    //   𝑵𝒐𝒏-𝑪𝒂𝒔𝒉 𝑪𝒐𝒏𝒕𝒓𝒊𝒃𝒖𝒕𝒊𝒐𝒏 — 
    //   𝑨𝒅𝒋𝒖𝒔𝒕𝒆𝒅 𝑭𝑴𝑽 — 𝑨𝒅𝒋𝒖𝒔𝒕𝒆𝒅 𝑭𝒂𝒊𝒓 𝑴𝒂𝒓𝒌𝒆𝒕 𝑽𝒂𝒍𝒖𝒆
    //       This is the first step in calculating the amount of
    //       "pie" that will be awarded.  FMV is used as the
    //       basis for all contributions, but each is adjusted
    //       using multipliers to account for the particular
    //       risk and type of contribution to make the reward fair.

    bytes32 public team_name = "The Pie Slicers";
    bytes32 public currency = "USD";

    // 𝗡𝗢𝗧𝗘:  For variable names ending in _x100, it means that
    // the value you assign to it needs to be the real-world value
    // multiplied by 100.  This is necessary because the system
    // only supports whole numbers.  _x10000, etc. are handled
    // similarly.  So 333.33%, which means 3.3333, when multiplied
    // by 10000, would be 33333, which is a whole number.

    // 𝗔𝗗𝗝𝗨𝗦𝗧𝗠𝗘𝗡𝗧𝗦:  These multipliers are applied to the
    // FMV of team members' contributions that are at-risk.
    // Additionally, the cash multiplier is significantly larger
    // to account for the fact that it is much harder to 𝒔𝒂𝒗𝒆
    // money than it is to 𝒆𝒂𝒓𝒏 money.
    uint16 public noncash_multiplier_x100 = 200;
    uint16 public cash_multiplier_x100 = 400;


    uint16 public royalty_rate_x10000 = 500;
    uint32 public finders_fee_cutoff_x100 = 0;
    uint16 public finders_fee_rate_precutoff_x10000 = 0;
    uint16 public finders_fee_rate_postcutoff_x10000 = 0;
    uint32 public pie_slices_x100 = 0;
    uint32 public well_value_x100 = 0;

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
