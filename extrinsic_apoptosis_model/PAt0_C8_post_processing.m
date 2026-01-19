function [m_SP__pp,dm_SP__pp] = PAt0_C8_post_processing(m_SP,dm_SP)
    
    % Post processing
    m_SP__pp = [m_SP(:,1:6)./m_SP(:,7) m_SP(:,7)];

    dm_SP__pp = cat(2,(bsxfun(@times,dm_SP(:,1:6,:),m_SP(:,7)) - ...
        bsxfun(@times,m_SP(:,1:6),dm_SP(:,7,:)))./...
        m_SP(:,7).^2,dm_SP(:,7,:));

    % m_SP__pp = m_SP;
    % dm_SP__pp = dm_SP;    
end

