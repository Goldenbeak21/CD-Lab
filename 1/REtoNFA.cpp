#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <stack>

using namespace std;

int nus()
{
    static int i=-1;
    i++;
    return i;
}

class NFA
{
public:
    int start, fin;
    unordered_map<int, unordered_map<char, unordered_set<int> > > delta;

    NFA(char c)
    {
        if(c=='~')  //~=phi
        {
            start = nus();
            fin = nus();

            delta[start] = unordered_map<char,unordered_set<int> >();
            delta[fin] = unordered_map<char,unordered_set<int> >();
        }
        else if(c=='e')  //e=epsilon
        {
            start = nus();
            fin = start;

            delta[start] = unordered_map<char,unordered_set<int> >();
        }
        else
        {
            start = nus();
            fin = nus();

            delta[start] = unordered_map<char,unordered_set<int> >();
            delta[fin] = unordered_map<char,unordered_set<int> >();

            delta[start][c] = unordered_set<int>();
            delta[start][c].insert(fin);
        }
    }

    NFA(int s, int f, NFA *l, NFA *r=NULL)
    {
        start = s;
        fin = f;
        delta = l->delta;
        if(r)
            for(auto it=r->delta.begin(); it!=r->delta.end(); it++)
            {
                delta[it->first] = it->second;
            }
    }

    void print()
    {
        // cout<<"The NFA is as follows:\n";
        // cout<<"Start state is: "<<start<<endl;
        // cout<<"Final state is: "<<fin<<endl<<endl;
        // cout<<"Edges(e is epsilon):\n";
        cout<<start<<endl;
        cout<<fin<<endl;
        for(auto it=delta.begin(); it!=delta.end(); it++)
        {
            for(auto jt=it->second.begin(); jt!=it->second.end(); jt++)
            {
                cout<<it->first<<" "<<jt->first<<" : ";
                for(auto kt=jt->second.begin(); kt!=jt->second.end(); kt++)
                    cout<<*kt<<" ";
                cout<<"\n";
            }
        }
    }

};

NFA star(NFA a)
{
    NFA n(nus(), nus(), &a);

    n.delta[n.start]['e'] = unordered_set<int>();
    n.delta[n.start]['e'].insert(a.start);
    n.delta[n.start]['e'].insert(n.fin);

    n.delta[a.fin]['e'] = unordered_set<int>();
    n.delta[a.fin]['e'].insert(a.start);
    n.delta[a.fin]['e'].insert(n.fin);

    return n;
}

NFA op(NFA l, NFA r, char o)
{
    if(o=='.')
    {
        NFA n(l.start, r.fin, &l, &r);

        n.delta[l.fin]['e'] = unordered_set<int>();
        n.delta[l.fin]['e'].insert(r.start);

        return n;
    }
    else    //o=='+'
    {
        NFA n(nus(), nus(), &l, &r);

        n.delta[n.start]['e'] = unordered_set<int>();
        n.delta[n.start]['e'].insert(l.start);
        n.delta[n.start]['e'].insert(r.start);

        n.delta[l.fin]['e'] = unordered_set<int>();
        n.delta[l.fin]['e'].insert(n.fin);
        n.delta[r.fin]['e'] = unordered_set<int>();
        n.delta[r.fin]['e'].insert(n.fin);

        return n;
    }
}

int main(int argc, char **argv)
{
    string re1,re,postRe;
    // cout<<"Enter the RE(e = epsilon; ~ = phi): ";
    // cin>>re1;

    if(argc<=1){
        printf("Supply the regex as a command line argument\n");
        return 0;
    }

    else re1 = argv[1];
    cout<<argv[1]<<endl;

    if(!re1.empty())
        re.push_back(re1[0]);
    for(int i=1; i<re1.length(); i++)
    {
        if(re1[i-1]!='+' && re1[i-1]!='(' && re1[i]!='+' && re1[i]!='*' && re1[i]!=')')
            re.push_back('.');
        re.push_back(re1[i]);
    }
    //cout<<re<<endl;


    stack<char> s;
    unordered_map<char,int> prec;
    prec['*']=2;
    prec['.']=1;
    prec['+']=0;
    for(int i=0; i<re.length(); i++)
    {
        if(re[i]=='(')
        {
            s.push('(');
        }
        else if(re[i]=='+' || re[i]=='.' || re[i]=='*')
        {
            if(s.empty())
                s.push(re[i]);
            else if(s.top()=='(')
                s.push(re[i]);
            else if(prec[re[i]]>prec[s.top()])
                s.push(re[i]);
            else
            {
                while(!s.empty() && s.top()!='(' && prec[s.top()]>=prec[re[i]])
                {
                    postRe.push_back(s.top());
                    s.pop();
                }
                s.push(re[i]);
            }
        }
        else if(re[i]==')')
        {
            while(!s.empty() && s.top()!='(')
            {
                postRe.push_back(s.top());
                s.pop();
            }
            if(!s.empty())
                s.pop();
        }
        else
            postRe.push_back(re[i]);
    }
    while(!s.empty())
    {
        postRe.push_back(s.top());
        s.pop();
    }
    //cout<<"The postfix notation of the RE is: "<<postRe<<endl<<endl;


    stack<NFA> ns;
    for(int i=0; i<postRe.length(); i++)
    {
        if(postRe[i]=='+' || postRe[i]=='.')
        {
            NFA r = ns.top();
            ns.pop();
            NFA l = ns.top();
            ns.pop();
            ns.push(op(l,r,postRe[i]));
        }
        else if(postRe[i]=='*')
        {
            NFA n=ns.top();
            ns.pop();
            ns.push(star(n));
        }
        else
        {
            ns.push(NFA(postRe[i]));
        }
    }
    ns.top().print();

    return 0;
}
