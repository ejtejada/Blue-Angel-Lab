//Authors: Edgar Tejada, cindyhappy9

pragma solidity ^0.4.24; //Ensure we are compatible with Solc max version compatible with Alipay's solc libs.
//See documentation:
//https://www.alibabacloud.com/help/doc-detail/109252.htm


///Goal of smart contract:
	///Fixing which problem?
		//Ensuring donation to charities involving green clean up projects are transparent, accountable, and legal.
		
	/*
	For Example: A Middle school [charity] has chemistry lab. Sometimes, during the process, wasted acid (hydrochloride) is created.
	School does not have enough money to safely store nor (*LAWFULLY*) dispose of the chemical.
	A donor is made aware of the problem, and want to help pay to store and dispose of the chemicals.
	However, neither the donor nor the middle school have the time nor the knowledge to select a qualified service provider for the clean up.
	Also, the service providor must be held accountable for completion of the project within one year to the [charity] within the given contract term limit.
	
	A third part evaluator, usually a qualified NGO, must select qualified service providor for a given job, must verify positive progress to task by half of the contract term, and must verify completion of full project.
	* 
	*/
	
///Payment cycle:

/*
 * 
 * 
Donation System:
		
		(1) Not simple, must insure the money used towards the right place. End current contract and find a new service providor to fill new contract, otherwise.
		
		Parts
		(0) Charity [reaches our to Blue-Angel network].
		(1) Service Provider bids for the job [given money if and only if successful as denoted by evaluator]
		(2) Evaluator [Select winning service providor based on qualifications, verifies quality of work at 50% and 100% of time line. Is paid some money from donation]
		(3) Donator/Investor [Locks all donation into smart contract for 1 years.]
		

		///Donation given to system, stats until system until job is done by at least one successful job.
		Payment in 1 years:
		10%	stage 1 (initial contract payout to winning service providor)
		(2.5%) System fees to Blue angel
		50%	stage 2 (service is good midyear year)
		(1.25%) Evaluator
		(35%) stage 3 (evaluator approves at end of year)
		(1.25%) Evaluator
 * 
 */


contract initialDonation
{
    identity constant BLUE_ANGEL_SYSTEM = 0x0000000000000000000000000000000000000000000000000000000000000000; //This is a dummy value for now until a sanctioned Alipay ID for Blue Angel exists.
    
    //Payment cycle, as described above.
    float constant downPayment2SP = 0.100;
    float constant systemFees = 0.025;
    float constant evaluatorFirst = 0.0125; 
    float constant firstPayment2SP = 0.500;
    float constant evaluatorSecond = 0.0125;
    float constant secondPayment2SP = 0.350;
    
    
    uint startDate; //Hold start of contract in UNIX time.
    unit endDate; //Hold the end of contract in UNIX time
    string charityName;
    /*Notice, the charity never holds nor controls the donated funds.*/
    
    string donorName;
    identity donor_id; //Alipay id of donor.
    
    string evaluatorName;
    identity evaluator_id; //Alipay id of NGO evaluator.
    
	identity[] biddingServiceProvidors; //List of service providors bidding for a job. This in memory, and has no preset size until the constructor happens.
	
	//Instances of arranged marriages between NGO evaluators and charities must be set by the network. (Currently, this is just Blue-Angel).
    constructor(string selectedCharity, string selectedNGO, identity selectedEvaluator, int number of biddingSP) public 
    {
        charityName = selectedCharity;
        evaluatorName = selectedEvaluator;
        evaluator_id = selectedEvaluator;
        //For now, the evaluator is always publicly known,
        //but the donator might not be.
        
        myArray.push(biddingSP); //Set number of bidding service providors for job. 
        
    }
    
    

	///Function calls go here.
    function authorizeDonation(identity eagerDonor, uint256 proposedDonation ) view protected returns (identity, string) 
    {
		require(msg.sender == eagerDonor); //Only Blue angel can authorize the request a donation. [FIXME]
        require(msg.reciever == BLUE_ANGEL_SYSTEM); //Only Blue angel can authorize the request a donation. [FIXME]
        require(msg.value >= 0); //
        
        require(eagerDonor.balance > proposedDonation)
        //Must have more funds than proposed donations. Is this public info in alipay[FIXME]?
        
        
        
        return false; //Assume failure
    }
    
    function evaluatorMarriesPS( identity[] biddingServiceProvidors) view protected returns (msg.value, bool)
    {
		//[Implement me]
		// Evaluator selects a PS from bidders within 24 hours, or the contract ends and funds return to donor.
	}
    
    function lockDonation() view private returns (bool)
    {
		//Payout 10% immediately to selected PS.
		//Lock 50% of functs for now + 1/2 of year
		//Lock the 35% funds into this contract for the time of now + one year
		
		
		//[IMPLEMENT ME]
	}
    
} //End initial donation
